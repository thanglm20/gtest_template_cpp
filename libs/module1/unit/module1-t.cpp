
#include "module1.hpp"
#include <gtest/gtest.h>


TEST(test_module1, sum_float) {
    
    int actual_result = sum_float(1.0, 2.0);
    int expected_result = 3.0;
    EXPECT_EQ(actual_result, expected_result);

}


