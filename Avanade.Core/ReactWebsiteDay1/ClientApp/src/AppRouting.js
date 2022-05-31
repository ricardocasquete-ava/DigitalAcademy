import React, { Fragment } from 'react';
import { Route } from 'react-router';

import Landing from './components/Landing';

const AppRouting = () => {

    return (
        <Fragment>
            <Route exact={true} path="/" component={Landing} />
        </Fragment>
    );
};
export default AppRouting;
