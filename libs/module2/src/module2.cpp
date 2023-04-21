#include "module2.hpp"


template<typename T,
typename std::enable_if_t<std::is_integral<T>::value, bool> = true>
int sum_int(T a, T b){
    return (a + b);
}
template int sum_int(int a, int b);