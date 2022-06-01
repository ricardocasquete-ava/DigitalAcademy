import React, { Fragment } from 'react';
import { Route } from 'react-router';

import Landing from './components/Landing';

import HelloWorld from './components/Samples/HelloWorld';
import Counter from './components/Samples/Counter';
import PropsSample from './components/Samples/PropsSample';

import LibraryFixed from './components/Samples/LibraryFixed';
import LibraryDynamic from './components/Samples/LibraryDynamic';

import Calculator from './components/Calculator/Calculator';


import ProductsList from './components/Products/ProductsList';
import ProductAddNew from './components/Products/ProductAddNew';

const AppRouting = (props) => {

    return (
        <Fragment>
            <Route exact={true} path="/" component={Landing} />

            <Route path='/HelloWorld' component={HelloWorld} />
            <Route path='/Counter' component={Counter} />
            <Route path='/PropsSample' component={PropsSample} />

            <Route path='/LibraryFixed' component={LibraryFixed} />
            <Route path='/LibraryDynamic' component={LibraryDynamic} />

            <Route path='/Calculator' component={Calculator} />


            <Route path='/Products/All' component={ProductsList} />
            <Route path='/Products/AddNew' component={ProductAddNew} />

        </Fragment>
    );
};
export default AppRouting;
