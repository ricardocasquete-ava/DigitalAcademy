import React, { Fragment} from 'react';
import { Container } from 'reactstrap';
import { NavMenu } from './NavMenu';
//import './../resources/css/App.css'

const AppLayout = (props) => {
    return (
        <Fragment>
            <NavMenu />
            <Container>
                {props.children}
            </Container>
        </Fragment>
    );
};
export default AppLayout;