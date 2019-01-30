## Encourage Python3 good habits even when using Python2-based Sage
# Suggested by Samuel Lelièvre
# https://groups.google.com/d/msg/sage-devel/uEHBKekJ_Cw/FKWUWb42DgAJ
from __future__ import division, absolute_import, print_function
from six import iteritems, iterkeys, itervalues
from six.moves import range
print('from __future__ import division, absolute_import, print_function')
print('from six import iteritems, iterkeys, itervalues')
print('from six.moves import range')

## Algebraic number printing
# from Brent Baccala: https://trac.sagemath.org/ticket/25210
try:
    AA.options.display_format = 'radical'
    print("AA.options.display_format = 'radical'")
except AttributeError:
    pass

## The golden mean phi as a quadratic number
z = polygen(QQ, 'z')
K = NumberField(z**2-z-1, 'phi', embedding=RR(1.6))
phi = K.gen()
print("z = polygen(QQ, 'z')")
print("K = NumberField(z**2-z-1, 'phi', embedding=RR(1.6))")
print("phi = K.gen()")

