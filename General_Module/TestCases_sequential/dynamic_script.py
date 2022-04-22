class dynamic():
    def compare(self, static_list, dynamic_list):
        print("dynamic List :-------", dynamic_list[0])
        print("Static List ------------", static_list)
        stat=set(static_list)
        dyn=set(dynamic_list)
        isthere=stat.issubset(dyn)
        return isthere
        

def check_static_bundle_found(static_list, dynamic_str):
    dynamic_str = dynamic_str if dynamic_str else ""
    dynamic_str=[str.split("@")[0].strip() for str in dynamic_str]
    print("dynamic List :-------", dynamic_str)
    print("Static List ------------", static_list)
    if not dynamic_str:
        return False
    # dynamic_list = list(dynamic_str.split(","))
    test = dynamic()
    if test.compare(static_list, dynamic_str):
        print("Static Value  found in Dynamic List")
        return True
    else:
        print("Static Value not found in Dynamic List")
        return False
