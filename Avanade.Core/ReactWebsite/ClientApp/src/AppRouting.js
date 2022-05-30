import React, { Fragment } from 'react';
import { Route } from 'react-router';

import Landing from './components/Landing';
import Products from './components/Products';
import Day1 from './components/Day1';

const AppRouting = (props) => {

    return (
        <Fragment>
            <Route match="/" component={Landing} />
            <Route path='/day1' component={Day1} />
            <Route path='/products' component={Products} />
        </Fragment>
    );
};
export default AppRouting;
