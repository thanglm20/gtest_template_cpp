#ifndef __module2_hpp__
#define __module2_hpp__
#include <type_traits>
#include <new>
template<typename T,
typename std::enable_if_t<std::is_integral<T>::value, bool> = true>
int sum_int(T a, T b);
#endif