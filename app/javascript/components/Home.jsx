import React from 'react';
import { Layout } from "antd";
import Header from './Header';
import Colleges from './Colleges';

const { Content, Footer } = Layout;

function Home() {
    return (
        <Layout className="layout">
            <Header />
            <Content style={{ padding: "0 50px" }}>
                <div className="site-layout-content" style={{ margin: "100px auto" }}>
                    <h1>Colleges</h1>
                    <Colleges />
                </div>
            </Content>
            <Footer style={{ textAlign: "center" }}>Colin Santee</Footer>
        </Layout>
    );
}

export default Home;