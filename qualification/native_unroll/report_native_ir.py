import json,pathlib
p=pathlib.Path("native-ir")
for name in ("plan.json","diagnostic-summary.json"):
    f=p/name
    if not f.is_file():
        print("MISSING_DIAGNOSTIC_FILE="+name);continue
    d=json.loads(f.read_text())
    if name=="plan.json":
        print("DIAGNOSTIC_PLAN_JSON="+json.dumps(d))
    else:
        for r in d["results"]:
            print("DIAGNOSTIC_RESULT_JSON="+json.dumps(r))
        print("DIAGNOSTIC_ERRORS_JSON="+json.dumps(d["errors"]))

