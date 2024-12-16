import React, {useEffect, useRef, useState} from "react"
import $ from "jquery"
import 'datatables.net-dt'
import "datatables.net-dt/css/dataTables.dataTables.css"
import { use } from "react"
import axios from "axios"

function Personel() {
    const tableRef  = useRef(null)
    const [loading, setLoading] = useState(true) 
    const [error, setError] = useState(null)
    const [personel, setPersonel] = useState([])
    useEffect(() => {
      const fetchPersonel = async () => {
        try {
          const response = await axios.get("http://127.0.0.1:8000/api/personel");
          if (response.data.success) {
            setPersonel(response.data.data);
          } else {
            setError("Data not found");
          }
        } catch (error) {
          setError(error.message);
          
        } finally {
          setLoading(false);
        }
      }
      fetchPersonel();
    }, []);

    useEffect(() => {
      if(!loading && !error){
        const table = $(tableRef.current).DataTable();
        return () => {
            table.destroy(false);
        }
      }
        
    }, [loading, error])
    return (
        <div className="container-fluid px-4">
  <h1 className="mt-4">Tables</h1>
  <ol className="breadcrumb mb-4">
    <li className="breadcrumb-item"><a href="index.html">Dashboard</a></li>
    <li className="breadcrumb-item active">Tables</li>
  </ol>
  <div className="card mb-4">
    <div className="card-body">
      DataTables is a third party plugin that is used to generate the demo table below. For more information about DataTables, please visit the
      <a target="_blank" href="https://datatables.net/">official DataTables documentation</a>
      .
    </div>
  </div>
  <div className="card mb-4">
    <div className="card-header">
      <i className="fas fa-table me-1" />
      DataTable Example
    </div>
    <div className="card-body">
     {loading ? (<p>Loading...</p>) : error ? (<p>{error}</p>) : (
      <table ref={tableRef}>
        <thead>
          <tr>
            <th>No</th>
            <th>Personel</th>
          </tr>
        </thead>
        <tfoot>
          <tr>
            <th>No</th>
            <th>Personel</th>
          </tr>
        </tfoot>
        <tbody>
          {personel.map((item, index) => (
            <tr key={item.id}>
              <td>{index + 1}</td>
              <td>{item.personel}</td>
            </tr>
          ))}
        </tbody>
      </table>
     )}
    </div>
  </div>
</div>

    )
}

export default Personel
