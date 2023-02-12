import DataStuctures.Stack.LinearStack
import Test.QuickCheck

ax1 x s = top (push x s) == x

ax2 x s = pop (push x s) == s

ax3 = isEmpty empty

ax4 x s = not (isEmpty (push x s))
