import { useEffect, useState } from "react";

function UserTable() {
    const [users, setUsers] = useState([]);

    const fetchData = () => {
        fetch("https://jsonplaceholder.typicode.com/users") 
            .then((response) => response.json())
            .then((data) => setUsers(data));
    };

    useEffect(() => {
        fetchData();
    }, []);

    return (
        <div>
            <button onClick={fetchData}>Refresh</button>
            <table>
                <tbody>
                    {users.map((user) => (
                        <tr key={user.id}>
                            <td>{user.name}</td>
                            <td>{user.email}</td>
                        </tr>
                    ))}
                </tbody>
            </table>
        </div>
    );
}

export default UserTable;