import shlex
import subprocess
import json

def clean_up_process():
    test_json = {
        "query": {
            "terms": {
                "username.keyword": ["rajdipr", "adwkumar", "shalverm", "sechandr", "sjayabal", "bayineni", "sivam",
                                     "alk", "s20r", "athiyaja", "gnanappa", "davthoma", "arrajago", "montm", "frigui",
                                     "ksaqib", "ssikarwa", "ymeguebl", "ymeguebli", "pmudgal", "skumarup", "n11singh",
                                     "sharmk", "venir", "shpandia", "rabegum", "srgummad", "mohdpate", "bisingh7"]
            }
        }}
    cmd = 'curl -X POST -u "elastic:LO26l31OKCQpH8DR307nzQ10" -k "https://elastic-alice-test-validation-staging.americas.abi.dyn.nesc.nokia.net/spark_rules/_delete_by_query" -H"Content-Type: application/json" -d \'{}\''.format(json.dumps(test_json))
    # print(cmd)
    args = shlex.split(cmd)
    process = subprocess.Popen(args, shell=False, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    stdout, stderr = process.communicate()
    print(stdout)
    print(stderr)
    return stdout, stderr



