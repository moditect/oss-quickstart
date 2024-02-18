#set( $symbol_pound = '#' )
#set( $symbol_dollar = '$' )
#set( $symbol_escape = '\' )
/*
 *  SPDX-License-Identifier: Apache-2.0
 *
 *  Copyright The original authors
 *
 *  Licensed under the Apache Software License version 2.0, available at http://www.apache.org/licenses/LICENSE-2.0
 */
package ${package};

import org.junit.jupiter.api.Test;

import static org.assertj.core.api.Assertions.*;

public class AppTest {

    @Test
    public void helloShouldReturnName() {
        App app = new App();
        assertThat(app.hello("Bob")).isEqualTo("Hello, Bob");
    }
}
