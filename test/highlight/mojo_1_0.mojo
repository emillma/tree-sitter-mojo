__extension List[Int]:
# <- keyword
    pass

__mlir_region region(x: Int):
# <- keyword
    pass

def conventions(imm x: Int, mut y: Int):
#               ^ keyword.modifier
#                           ^ keyword.modifier
    pass

def effects() raises capturing thin abi("C"):
#             ^ keyword
#                    ^ keyword.modifier
#                              ^ keyword.modifier
#                                   ^ keyword.modifier
    pass

def captures() unified {read value}:
#              ^ keyword
#                       ^ keyword.modifier
    pass

comptime Generator: __generator_type[Index: Int] Int
#                   ^ type.builtin
