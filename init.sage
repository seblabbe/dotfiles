
# from Brent Baccala: https://trac.sagemath.org/ticket/25210
try:
    AA.options.display_format = 'radical'
    print("AA.options.display_format = 'radical'")
except AttributeError:
    pass

z = polygen(QQ, 'z')
K = NumberField(z**2-z-1, 'phi', embedding=RR(1.6))
phi = K.gen()
print("z = polygen(QQ, 'z')")
print("K = NumberField(z**2-z-1, 'phi', embedding=RR(1.6))")
print("phi = K.gen()")
