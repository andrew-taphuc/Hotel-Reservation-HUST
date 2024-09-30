import React from 'react'
import BookingList from './BookingList'

const Admin = () => {
  return (
    <div className='list-group'>
      <h1 className='text-2xl font-bold mb-4'>Booking Management</h1>
      <BookingList/>
    </div>
  )
}

export default Admin