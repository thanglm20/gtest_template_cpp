
#include "module2.hpp"
#include <gtest/gtest.h>


TEST(test_module2, sum_int) {
    
    int actual_result = sum_int(1, 2);
    int expected_result = 3;
    EXPECT_EQ(actual_result, expected_result);

}


