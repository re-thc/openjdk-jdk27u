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
