import React, { Fragment } from 'react';
import { Route } from 'react-router';

import Landing from './components/Landing';

import HelloWorld from './components/Samples/HelloWorld';
import Counter from './components/Samples/Counter';
import PropsSample from './components/Samples/PropsSample';

import LibraryFixed from './components/Samples/LibraryFixed';
import LibraryDynamic from './components/Samples/LibraryDynamic';

import Products from './components/Samples/Products';
import Calculator from './components/Calculator/Calculator';

const AppRouting = (props) => {

    return (
        <Fragment>
            <Route exact={true} path="/" component={Landing} />

            <Route path='/HelloWorld' component={HelloWorld} />
            <Route path='/Counter' component={Counter} />
            <Route path='/PropsSample' component={PropsSample} />

            <Route path='/LibraryFixed' component={LibraryFixed} />
            <Route path='/LibraryDynamic' component={LibraryDynamic} />

            <Route path='/Products' component={Products} />
            <Route path='/Calculator' component={Calculator} />
        </Fragment>
    );
};
export default AppRouting;
