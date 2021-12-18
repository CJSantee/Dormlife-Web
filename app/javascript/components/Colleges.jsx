import React, { useEffect, useState } from "react";

import { Table, message, Popconfirm } from "antd";

function Colleges() {
    const columns = [
        {
            title: "Name",
            dataIndex: "name",
            key: "name"
        },
        {
            title: "",
            key: "action",
            render: (_text, record) => (
                <Popconfirm title="Are you sure? This action cannot be undone." onConfirm={() => deleteCollege(record.id)} okText="Yes" cancelText="No">
                    <a href="" type="danger">
                        Delete{" "}
                    </a>
                </Popconfirm>
            )
        }
    ]
    const [colleges, setColleges] = useState([]);

    const reloadColleges = () => {
        setColleges([]);
        loadColleges();
    }

    const deleteCollege = (id) => {
        const url = `api/v1/colleges/${id}`;
        fetch(url, {
            method: "delete"
        })
            .then((data) => {
                if (data.ok) {
                    reloadColleges();
                    return data.json();
                }
                throw new Error("Network error.");
            })
            .catch((err) => message.error("Error: " + err));
    }

    const loadColleges = () => {
        const url = "api/v1/colleges";
        fetch(url)
            .then((data) => {
                if (data.ok) {
                    return data.json();
                }
                throw new Error("Networ error.");
            })
            .then((data) => {
                setColleges(data)
            })
            .catch((err) => message.error("Error: "+ err));
    }

    useEffect(() => {
        loadColleges();
    }, [])

    return (
        <>
            <Table className="table-striped-rows" dataSource={colleges} columns={columns} pagination={{ pageSize: 5 }} />
        </>
    );
}

export default Colleges;