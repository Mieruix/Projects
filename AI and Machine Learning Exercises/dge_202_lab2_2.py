# -*- coding: utf-8 -*-
"""DGE-202_Lab2.2.ipynb

Automatically generated by Colaboratory.

Original file is located at
    https://colab.research.google.com/drive/1W82V8pZ1Joor1yFa1m56vDmFQcHPI4Oc
"""

# Juntorn Thiantanukij 2021610213
# Vector Dunder Method

import math
class Vector:

    def __init__(self, x, y):
        self.x = x
        self.y = y

    def __add__(self, vector):
        return Vector(self.x + vector.x, self.y + vector.y)

    def __sub__(self, vector):
        return Vector(self.x - vector.x, self.y - vector.y)

    def __mul__(self, vector):
        return self.x * vector.x + self.y * vector.y

    vec1 = Vector(0, 6)
    vec2 = Vector(0, 6)

    vec3 = vec1 + vec2
    vec4 = vec1 - vec2
    vec5 = vec1 * vec2


    print('Vector 1 + Vector 2:')
    print(vec3.x, vec3.y)
    print('')

    print('Vector 1 - Vector 2:')
    print(vec4.x, vec4.y)
    print('')

    print('Vector 1 * Vector 2:')
    print(vec5)
    print('')