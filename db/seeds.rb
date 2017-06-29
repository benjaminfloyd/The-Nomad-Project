Post.delete_all
City.delete_all


City.create([
    { name: 'Atlanta',
     state: 'Georgia', 
    image: 'http://i.huffpost.com/gen/1716876/images/o-ATLANTA-TRAFFIC-facebook.jpg' },
    { name: 'San Francisco',
     state: 'California', 
    image: 'https://unsplash.it/600/440?image=693' },
    { name: 'Las Vegas',
     state: 'Nevada', 
    image: 'https://unsplash.it/600/440?image=452' },
    { name: 'London',
     state: 'England', 
    image: 'https://unsplash.it/600/440?image=792' }
    
])