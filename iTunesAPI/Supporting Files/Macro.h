//
//  Macro.h
//  iTunesAPI
//
//  Created by Kuznetsov Aleksey on 15.05.2018.
//  Copyright © 2018 Kuznetsov Aleksey. All rights reserved.
//

#ifndef Macro_h
#define Macro_h

#define Weakify(var) \
__weak __typeof__(var) macro_concat(var, _weak_) = var

#define Strongify(var) \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Wshadow\"") \
__strong __typeof__(var) var = macro_concat(var, _weak_) \
_Pragma("clang diagnostic pop")

#define macro_concat(A, B) A##B

#endif /* Macro_h */
