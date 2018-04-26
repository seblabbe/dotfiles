
# from Brent Baccala: https://trac.sagemath.org/ticket/25210
try:
    AA.options.display_format = 'radical'
    print "AA.options.display_format = 'radical'"
except AttributeError:
    pass

