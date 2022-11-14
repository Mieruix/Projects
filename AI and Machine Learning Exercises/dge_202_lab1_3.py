# -*- coding: utf-8 -*-
"""DGE-202_LAB1.3.ipynb

Automatically generated by Colaboratory.

Original file is located at
    https://colab.research.google.com/drive/1Lvawyz1Wn_gfAy_XikL7ohT1-cDUGXY0
"""

# Juntorn Thiantanukij 2021610213
# Exercise 3 Vectors

import math
class Vector:

    def __init__(self, x, y):
        self.x = x
        self.y = y

    def addition(self, vector):
        return Vector(self.x + vector.x, self.y + vector.y)

    def subtraction(self, vector):
        return Vector(self.x - vector.x, self.y - vector.y)

    def scalarMulti(self, vector):
        return self.x * vector.x + self.y * vector.y

    def lenght(self, vector):
        return math.sqrt(((self.x - vector.x) ** 2)+((self.y - vector.y) ** 2))


vec1 = Vector(3, 4)
vec2 = Vector(5, 6)

print("Vector 1: ", vec1.x, "i +", vec1.y, "j")
print("Vector 2: ", vec2.x, "i +", vec2.y, "j")
print("")

vec3 = Vector.addition(vec1, vec2)
print("Vector 1 + Vector 2 = ", vec3.x, "i +", vec3.y, "j")
print("")

vec3 = Vector.subtraction(vec1, vec2)
print("Vector 1 - Vector 2 = ", vec3.x, "i +", vec3.y, "j")
print("")

vec3 = Vector.scalarMulti(vec1, vec2)
print("Vector 1 x Vector 2 = ", vec3)
print("")

vec3 = Vector.lenght(vec1, vec2)
print("Lenght between 2 vectors = ", vec3)