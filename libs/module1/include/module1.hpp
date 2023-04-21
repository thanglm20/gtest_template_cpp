#ifndef __module2_hpp__
#define __module2_hpp__
#include <type_traits>
#include <new>
template<typename T,
typename std::enable_if_t<std::is_floating_point<T>::value, bool> = true>
float sum_float(T a, T b);
#endif