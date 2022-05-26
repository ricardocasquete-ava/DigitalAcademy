import React, { Fragment } from 'react';
import { Route } from 'react-router';

import Landing from './components/Landing';

const AppRouting = (props) => {

    return (
        <Fragment>
            <Route match="/" component={Landing}/>
        </Fragment>
    );
};
export default AppRouting;
