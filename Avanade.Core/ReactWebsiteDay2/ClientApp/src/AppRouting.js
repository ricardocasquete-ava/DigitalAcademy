import React, { Fragment } from 'react';
import { Route } from 'react-router';

import Landing from './components/Landing';

import ProductsList from './components/Products/ProductsList';
import ProductAddNew from './components/Products/ProductAddNew';

const AppRouting = (props) => {

    return (
        <Fragment>
            <Route exact={true} path="/" component={Landing} />

            <Route path='/Products/All' component={ProductsList} />
            <Route path='/Products/AddNew' component={ProductAddNew} />

        </Fragment>
    );
};
export default AppRouting;
