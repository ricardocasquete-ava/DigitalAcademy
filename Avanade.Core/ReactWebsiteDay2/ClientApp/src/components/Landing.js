import React, { Fragment } from 'react';
import { Container, Jumbotron, Row, Col, Image, Media } from 'reactstrap';

import avaLogo from './../resources/images/avaLogo.png';

const Landing = (props) => {

    return (
        <Fragment>
            <Container>
                <Row>
                    <Col className="text-center">
                        <h1>Avanade Digital Academy - <b>React Me Up!!!!</b></h1>
                        <br />
                    </Col>
                </Row>
                <Row>
                    <Col lg="4">
                        <img src={avaLogo} className="img-fluid"></img>
                    </Col>
                    <Col lg="8">
                        <Jumbotron>
                            <Container>
                                <Row>
                                    <Col>
                                        <h2>Welcome the React Training Guide</h2>
                                        <p>Here you will learn</p>
                                    </Col>
                                </Row>
                                <Row>
                                    <Col lg="8">
                                        <ul>
                                            <li>The basics of React</li>
                                            <li>How to create components and hooks</li>
                                            <li>Query and display Data</li>
                                        </ul>
                                    </Col>
                                </Row>
                            </Container>

                        </Jumbotron>
                    </Col>
                </Row>
            </Container>
        </Fragment>
    );
};
export default Landing;