import sys
def stara():
    return "abba"

def bara():
    return "baba"

print(globals()[sys.argv[1]]())
