import React from 'react';
import { Palmtree, Waves, Utensils, Sun } from 'lucide-react';

const Page1 = () => {
  return (
    <div className="min-h-screen bg-gradient-to-b from-blue-400 to-teal-500 text-white font-sans">
      <header className="p-6 bg-white bg-opacity-10 backdrop-blur-md">
        <h1 className="text-4xl font-serif text-center">Luxury Maldives Getaway</h1>
      </header>

      <main className="container mx-auto px-6 py-12">
        <section className="mb-12">
          <img src="/api/placeholder/1200/600" alt="Maldives Luxury Resort" className="w-full h-96 object-cover rounded-lg shadow-lg mb-6" />
          <p className="text-xl leading-relaxed">
            Experience unparalleled luxury in the heart of the Indian Ocean. The Maldives offers a perfect blend of pristine beaches, 
            crystal-clear waters, and world-class hospitality. Our curated luxury experience ensures every moment of your stay is 
            nothing short of extraordinary.
          </p>
        </section>

        <section className="mb-12">
          <h2 className="text-3xl font-serif mb-6">Accommodation</h2>
          <div className="bg-white bg-opacity-20 backdrop-blur-md rounded-lg p-6">
            <h3 className="text-2xl mb-4">Overwater Villa</h3>
            <ul className="list-disc list-inside space-y-2">
              <li>Spacious 250 sq m villa with private infinity pool</li>
              <li>Direct lagoon access with house reef for snorkeling</li>
              <li>Glass floor panels for underwater views</li>
              <li>24/7 butler service</li>
              <li>Luxurious bathroom with ocean view bathtub</li>
            </ul>
          </div>
        </section>

        <section className="mb-12">
          <h2 className="text-3xl font-serif mb-6">Exclusive Experiences</h2>
          <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
            <div className="bg-white bg-opacity-20 backdrop-blur-md rounded-lg p-6 flex items-start">
              <Waves className="mr-4 flex-shrink-0" size={24} />
              <div>
                <h3 className="text-xl font-semibold mb-2">Private Sunset Cruise</h3>
                <p>Sail into the sunset on a luxury yacht, complete with champagne and canapés.</p>
              </div>
            </div>
            <div className="bg-white bg-opacity-20 backdrop-blur-md rounded-lg p-6 flex items-start">
              <Utensils className="mr-4 flex-shrink-0" size={24} />
              <div>
                <h3 className="text-xl font-semibold mb-2">Underwater Dining</h3>
                <p>Enjoy a gourmet meal in the world's largest all-glass undersea restaurant.</p>
              </div>
            </div>
            <div className="bg-white bg-opacity-20 backdrop-blur-md rounded-lg p-6 flex items-start">
              <Palmtree className="mr-4 flex-shrink-0" size={24} />
              <div>
                <h3 className="text-xl font-semibold mb-2">Island Hopping</h3>
                <p>Explore uninhabited islands and hidden lagoons via private seaplane.</p>
              </div>
            </div>
            <div className="bg-white bg-opacity-20 backdrop-blur-md rounded-lg p-6 flex items-start">
              <Sun className="mr-4 flex-shrink-0" size={24} />
              <div>
                <h3 className="text-xl font-semibold mb-2">Spa Retreat</h3>
                <p>Indulge in a full-day spa experience with treatments using local ingredients.</p>
              </div>
            </div>
          </div>
        </section>

        <section>
          <h2 className="text-3xl font-serif mb-6">Booking Information</h2>
          <div className="bg-white bg-opacity-20 backdrop-blur-md rounded-lg p-6">
            <p className="mb-4">
              Our luxury packages start from $5,000 per night, including accommodation, daily breakfast, and airport transfers.
            </p>
            <p className="mb-4">
              For reservations and inquiries, please contact our dedicated luxury travel concierge:
            </p>
            <p className="font-semibold">
              Email: luxury@maldivesgetaway.com<br />
              Phone: +960 123 4567
            </p>
          </div>
        </section>
      </main>

      <footer className="bg-white bg-opacity-10 backdrop-blur-md py-6 text-center mt-12">
        <p>&copy; 2024 Luxury Maldives Getaway. All rights reserved.</p>
      </footer>
    </div>
  );
};

export default Page1;