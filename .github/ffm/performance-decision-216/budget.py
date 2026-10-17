"""Pure fixed attempt-budget arithmetic. No clock or host reads on import."""


def validate_budget(record):
    if type(record) is not dict or type(record.get("start_monotonic_ns")) is not int:
        raise ValueError("actual attempt start required")
    start = record["start_monotonic_ns"]
    if start <= 0 or record.get("preparation_deadline_ns") != start + 5100_000_000_000:
        raise ValueError("fixed 85-minute preparation deadline differs")
    if record.get("overall_deadline_ns") != start + 9000_000_000_000:
        raise ValueError("fixed 150-minute overall deadline differs")
    if type(record.get("boot_id")) is not str or not record["boot_id"]:
        raise ValueError("attempt boot identity required")
    return record


def campaign_deadline(record, now):
    validate_budget(record)
    if type(now) is not int or not record["start_monotonic_ns"] <= now <= record["preparation_deadline_ns"]:
        raise ValueError("preparation budget expired or clock is incoherent; no timing launch")
    deadline = now + 3600_000_000_000
    if deadline > record["overall_deadline_ns"] - 300_000_000_000:
        raise ValueError("full campaign plus five-minute sealing reserve unavailable")
    return deadline


def overall_budget_passed(record, end):
    validate_budget(record)
    return type(end) is int and record["start_monotonic_ns"] <= end <= record["overall_deadline_ns"]


def final_budget_observation(record, collector_status, returncode, returned_ns,
                             cleanup_observed_ns, cleanup_complete):
    """Owner observation after collector return and final owned-child cleanup.

    The observation closes the attempt endpoint; persisting this audit record
    cannot turn the collector's earlier pre-seal estimate into authoritative data.
    """
    validate_budget(record)
    if (type(returncode) is not int or type(returned_ns) is not int
            or type(cleanup_observed_ns) is not int or type(cleanup_complete) is not bool
            or not record["start_monotonic_ns"] <= returned_ns <= cleanup_observed_ns):
        raise ValueError("ordered process-return and final-cleanup observations required")
    in_budget = overall_budget_passed(record, cleanup_observed_ns)
    status = collector_status
    if returncode != 0:
        status = "STOPPED_EXECUTION_FAILURE"
    if not cleanup_complete:
        status = "STOPPED_CLEANUP_INCOMPLETE"
    if not in_budget:
        status = "STOPPED_OVERALL_BUDGET"
    return dict(status=status, collector_status=collector_status, process_return_code=returncode,
                process_return_monotonic_ns=returned_ns,
                final_cleanup_observed_monotonic_ns=cleanup_observed_ns,
                final_cleanup_complete=cleanup_complete,
                overall_deadline_ns=record["overall_deadline_ns"],
                overall_budget_passed=in_budget and cleanup_complete,
                terminal_observation_passed=in_budget and cleanup_complete and returncode == 0,
                authoritative_process_return_and_cleanup=True, shipping_qualified=False)
