#include "module1.hpp"



template<typename T,
typename std::enable_if_t<std::is_floating_point<T>::value, bool> = true>
float sum_float(T a, T b){
    return (a + b);
}
template float sum_float(double a, double b);