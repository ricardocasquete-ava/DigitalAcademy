import React, { Fragment } from 'react';
import { Route } from 'react-router';

import Landing from './components/Landing';
import Counter from './components/Counter';
import HelloWorld from './components/HelloWorld';
import ProductList from './components/ProductList';

const AppRouting = () => {

    return (
        <Fragment>
            <Route exact={true} path="/" component={Landing} />
            <Route exact={true} path="/Counter" component={Counter} />
            <Route exact={true} path="/HW" component={HelloWorld} />

            <Route exact={true} path="/Products" component={ProductList} />
        </Fragment>
    );
};
export default AppRouting;
