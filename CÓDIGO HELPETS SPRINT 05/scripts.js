document.getElementById('contact-form').addEventListener('submit', function(event) {
    event.preventDefault();
    alert('Obrigado por entrar em contato! Responderemos em breve.');
});

const filterButtons = document.querySelectorAll('.filter-btn');
const petCards = document.querySelectorAll('.category-gallery .pet-card');

filterButtons.forEach(button => {
    button.addEventListener('click', () => {
        const category = button.getAttribute('data-category');
        petCards.forEach(card => {
            if (card.getAttribute('data-category') === category) {
                card.style.display = 'block';
            } else {
                card.style.display = 'none';
            }
        });
    });
});

// inicialmente mostrar todos os animais
petCards.forEach(card => {
    card.style.display = 'block';
});



document.getElementById('filter-button').addEventListener('click', function() {
    // obbter os valores selecionados nos campos do formulário
    const selectedSpecies = document.getElementById('species').value;
    const selectedSize = document.getElementById('size').value;
    const selectedAge = document.getElementById('age').value;

    // obter todos os cards de animais da galeria
    const petCards = document.querySelectorAll('#gallery .pet-card');

    // ler sobre cada card de animal e aplicar o filtro
    petCards.forEach(card => {
        const species = card.getAttribute('data-species');
        const size = card.getAttribute('data-size');
        const age = card.getAttribute('data-age');

        // ver se o card atende aos critérios de filtro selecionados
        const showCard = (selectedSpecies === 'all' || selectedSpecies === species) &&
                        (selectedSize === 'all' || selectedSize === size) &&
                        (selectedAge === 'all' || selectedAge === age);

        // mostrar ou ocultar o card com base no resultado do filtro
        if (showCard) {
            card.style.display = 'block';
        } else {
            card.style.display = 'none';
        }
    });
});

document.getElementById('register-button').addEventListener('click', function() {
    const name = document.getElementById('pet-name').value;
    const species = document.getElementById('pet-species').value;
    const size = document.getElementById('pet-size').value;
    const age = document.getElementById('pet-age').value;
    const image = document.getElementById('pet-image').files[0];

    if (!name || !species || !size || !age || !image) {
        alert('Por favor, preencha todos os campos.');
        return;
    }

    const reader = new FileReader();
    reader.onload = function(e) {
        const gallery = document.querySelector('#gallery .gallery');
        const card = document.createElement('div');
        card.className = 'pet-card';
        card.setAttribute('data-species', species);
        card.setAttribute('data-size', size);
        card.setAttribute('data-age', age);

        const img = document.createElement('img');
        img.src = e.target.result;
        img.alt = `${size} ${species} ${age}`;

        const p = document.createElement('p');
        p.textContent = `Nome: ${name}`;

        card.appendChild(img);
        card.appendChild(p);
        gallery.appendChild(card);
    };

    reader.readAsDataURL(image);
});

document.querySelectorAll('.favorite-button').forEach(button => {
    button.addEventListener('click', function() {
        const card = this.parentElement;
        const petName = card.querySelector('p').textContent;

        if (this.classList.toggle('favorited')) {
            addFavorite(card);
            alert(`${petName} adicionado aos favoritos!`);
        } else {
            removeFavorite(card);
            alert(`${petName} removido dos favoritos!`);
        }
    });
});

function addFavorite(card) {
    const favoritesGallery = document.querySelector('.favorites-gallery');
    const favoriteCard = card.cloneNode(true);
    favoritesGallery.appendChild(favoriteCard);
    saveFavorites();
}

function removeFavorite(card) {
    const favoritesGallery = document.querySelector('.favorites-gallery');
    const petName = card.querySelector('p').textContent;
    const favoriteCards = favoritesGallery.querySelectorAll('.pet-card');
    favoriteCards.forEach(favoriteCard => {
        if (favoriteCard.querySelector('p').textContent === petName) {
            favoritesGallery.removeChild(favoriteCard);
        }
    });
    saveFavorites();
}

function saveFavorites() {
    const favoritesGallery = document.querySelector('.favorites-gallery');
    const favoriteCards = favoritesGallery.querySelectorAll('.pet-card');
    const favorites = [];
    favoriteCards.forEach(card => {
        const pet = {
            name: card.querySelector('p').textContent,
            species: card.getAttribute('data-species'),
            size: card.getAttribute('data-size'),
            age: card.getAttribute('data-age'),
            image: card.querySelector('img').src
        };
        favorites.push(pet);
    });
    localStorage.setItem('favorites', JSON.stringify(favorites));
}

function loadFavorites() {
    const favorites = JSON.parse(localStorage.getItem('favorites')) || [];
    const favoritesGallery = document.querySelector('.favorites-gallery');
    favorites.forEach(pet => {
        const card = document.createElement('div');
        card.className = 'pet-card';
        card.setAttribute('data-species', pet.species);
        card.setAttribute('data-size', pet.size);
        card.setAttribute('data-age', pet.age);

        const img = document.createElement('img');
        img.src = pet.image;
        img.alt = `${pet.size} ${pet.species} ${pet.age}`;

        const p = document.createElement('p');
        p.textContent = pet.name;

        const button = document.createElement('button');
        button.className = 'favorite-button favorited';
        button.textContent = '❤️';
        button.addEventListener('click', function() {
            removeFavorite(card);
            this.classList.remove('favorited');
        });

        card.appendChild(img);
        card.appendChild(p);
        card.appendChild(button);
        favoritesGallery.appendChild(card);
    });
}

document.addEventListener('DOMContentLoaded', loadFavorites);

document.querySelectorAll('.comment-button').forEach(button => {
    button.addEventListener('click', function() {
        const card = this.parentElement.parentElement;
        const commentInput = card.querySelector('.comment-input');
        const commentText = commentInput.value.trim();
        if (commentText) {
            addComment(card, commentText);
            commentInput.value = '';
        }
    });
});

function addComment(card, commentText) {
    const commentsList = card.querySelector('.comments-list');
    const commentItem = document.createElement('li');
    commentItem.textContent = commentText;
    commentsList.appendChild(commentItem);
    saveComments(card);
}

function saveComments(card) {
    const petName = card.querySelector('p').textContent;
    const commentsList = card.querySelector('.comments-list');
    const comments = [];
    commentsList.querySelectorAll('li').forEach(commentItem => {
        comments.push(commentItem.textContent);
    });
    localStorage.setItem(`comments-${petName}`, JSON.stringify(comments));
}

function loadComments() {
    const petCards = document.querySelectorAll('.pet-card');
    petCards.forEach(card => {
        const petName = card.querySelector('p').textContent;
        const comments = JSON.parse(localStorage.getItem(`comments-${petName}`)) || [];
        const commentsList = card.querySelector('.comments-list');
        comments.forEach(commentText => {
            const commentItem = document.createElement('li');
            commentItem.textContent = commentText;
            commentsList.appendChild(commentItem);
        });
    });
}

document.addEventListener('DOMContentLoaded', loadComments);

document.getElementById('add-event-button').addEventListener('click', function() {
    const name = document.getElementById('event-name').value;
    const location = document.getElementById('event-location').value;
    const date = document.getElementById('event-date').value;

    if (!name || !location || !date) {
        alert('Por favor, preencha todos os campos.');
        return;
    }

    const eventsList = document.querySelector('.events-list');
    const eventItem = document.createElement('li');
    eventItem.textContent = `${name} - ${location} - ${date}`;
    eventsList.appendChild(eventItem);
    saveEvents();
});

function saveEvents() {
    const eventsList = document.querySelector('.events-list');
    const events = [];
    eventsList.querySelectorAll('li').forEach(eventItem => {
        events.push(eventItem.textContent);
    });
    localStorage.setItem('events', JSON.stringify(events));
}

function loadEvents() {
    const events = JSON.parse(localStorage.getItem('events')) || [];
    const eventsList = document.querySelector('.events-list');
    events.forEach(eventText => {
        const eventItem = document.createElement('li');
        eventItem.textContent = eventText;
        eventsList.appendChild(eventItem);
    });
}

document.addEventListener('DOMContentLoaded', loadEvents);

document.getElementById('add-event-button').addEventListener('click', function() {
    const name = document.getElementById('event-name').value;
    const location = document.getElementById('event-location').value;
    const date = document.getElementById('event-date').value;

    if (!name || !location || !date) {
        alert('Por favor, preencha todos os campos.');
        return;
    }

    const eventsList = document.querySelector('.events-list');
    const eventItem = document.createElement('li');
    eventItem.textContent = `${name} - ${location} - ${date}`;
    eventsList.appendChild(eventItem);
    saveEvents();
});

function saveEvents() {
    const eventsList = document.querySelector('.events-list');
    const events = [];
    eventsList.querySelectorAll('li').forEach(eventItem => {
        events.push(eventItem.textContent);
    });
    localStorage.setItem('events', JSON.stringify(events));
}

function loadEvents() {
    const events = JSON.parse(localStorage.getItem('events')) || [];
    const eventsList = document.querySelector('.events-list');
    events.forEach(eventText => {
        const eventItem = document.createElement('li');
        eventItem.textContent = eventText;
        eventsList.appendChild(eventItem);
    });
}

document.addEventListener('DOMContentLoaded', loadEvents);

// Sistema de Notificações Personalizadas
document.getElementById('notifications-form').addEventListener('submit', function(event) {
    event.preventDefault();

    let preferences = [];
    document.querySelectorAll('input[name="notifications"]:checked').forEach((checkbox) => {
        preferences.push(checkbox.value);
    });

    alert('Preferências salvas: ' + preferences.join(', '));
});

// Chat em Tempo Real com ONGs e Abrigos
document.getElementById('send-button').addEventListener('click', function() {
    const messageInput = document.getElementById('message-input');
    const message = messageInput.value;

    if (message.trim() !== '') {
        const messageDiv = document.createElement('div');
        messageDiv.textContent = message;
        document.getElementById('messages').appendChild(messageDiv);
        messageInput.value = '';
    }
});

// Sistema de Doações para ONGs e Abrigos
document.getElementById('donation-form').addEventListener('submit', function(event) {
    event.preventDefault();

    const ong = document.getElementById('ong').value;
    const donationType = document.getElementById('donation-type').value;
    const amount = document.getElementById('amount').value;

    alert(`Doação registrada: ONG/Abrigo: ${ong}, Tipo: ${donationType}, Valor/Itens: ${amount}`);
});

// Sistema de Cadastro de Animais Perdidos e Encontrados
document.getElementById('lost-found-form').addEventListener('submit', function(e) {
    e.preventDefault();
    const status = document.getElementById('pet-status').value;
    const description = document.getElementById('pet-description').value;
    const photo = document.getElementById('pet-photo').files[0];
    const contactInfo = document.getElementById('contact-info').value;

    const pet = {
        status,
        description,
        photo: URL.createObjectURL(photo),
        contactInfo
    };

    const petList = document.getElementById('lost-found-list');
    const petElement = document.createElement('div');
    petElement.innerHTML = `
        <h3>${status === 'lost' ? 'Perdido' : 'Encontrado'}</h3>
        <p>${description}</p>
        <img src="${pet.photo}" alt="Foto do Pet">
        <p>Contato: ${contactInfo}</p>
    `;
    petList.appendChild(petElement);
});

// Sistema de Histórias de Sucesso
document.getElementById('story-form').addEventListener('submit', function(e) {
    e.preventDefault();
    const storyText = document.getElementById('story-text').value;
    const storyPhoto = document.getElementById('story-photo').files[0];
    const storyVideo = document.getElementById('story-video').files[0];

    const story = {
        text: storyText,
        photo: storyPhoto ? URL.createObjectURL(storyPhoto) : null,
        video: storyVideo ? URL.createObjectURL(storyVideo) : null
    };

    const stories = document.getElementById('stories');
    const storyElement = document.createElement('div');
    storyElement.innerHTML = `
        <p>${story.text}</p>
        ${story.photo ? `<img src="${story.photo}" alt="Foto do Pet">` : ''}
        ${story.video ? `<video src="${story.video}" controls>Vídeo do Pet</video>` : ''}
    `;
    stories.appendChild(storyElement);
});

// Fórum de Discussão
document.getElementById('forum-form').addEventListener('submit', function(e) {
    e.preventDefault();
    const topic = document.getElementById('forum-topic').value;
    const message = document.getElementById('forum-message').value;

    const discussion = {
        topic,
        message
    };

    const discussions = document.getElementById('forum-discussions');
    const discussionElement = document.createElement('div');
    discussionElement.innerHTML = `
        <h3>${discussion.topic}</h3>
        <p>${discussion.message}</p>
    `;
    discussions.appendChild(discussionElement);
});

// Apadrinhamento de Pets
document.getElementById('sponsorship-form').addEventListener('submit', function(e) {
    e.preventDefault();
    const pet = document.getElementById('sponsor-pet').value;

    const sponsorship = {
        pet
    };

    const sponsorshipUpdates = document.getElementById('sponsorship-updates');
    const sponsorshipElement = document.createElement('div');
    sponsorshipElement.innerHTML = `
        <h3>Você apadrinhou o ${sponsorship.pet}!</h3>
        <p>Você receberá atualizações regulares sobre o ${sponsorship.pet}.</p>
    `;
    sponsorshipUpdates.appendChild(sponsorshipElement);
});

// Match para Adoção
document.getElementById('match-form').addEventListener('submit', function(e) {
    e.preventDefault();
    const questionnaire = document.getElementById('match-questionnaire').value;

    const match = {
        questionnaire
    };

    const matchResults = document.getElementById('match-results');
    const matchElement = document.createElement('div');
    matchElement.innerHTML = `
        <h3>Resultados do Match</h3>
        <p>Baseado nas suas respostas, encontramos os seguintes pets:</p>
        <ul>
            <li>Pet A - Descrição</li>
            <li>Pet B - Descrição</li>
            <li>Pet C - Descrição</li>
        </ul>
    `;
    matchResults.appendChild(matchElement);
});

// Histórias de Sucesso
document.getElementById('success-form').addEventListener('submit', function(e) {
    e.preventDefault();
    const title = document.getElementById('success-title').value;
    const story = document.getElementById('success-story').value;
    const photo = document.getElementById('success-photo').files[0];
    const video = document.getElementById('success-video').files[0];

    const reader = new FileReader();
    reader.onload = function(event) {
        const successStory = {
            title,
            story,
            photo: photo ? event.target.result : '',
            video: video ? URL.createObjectURL(video) : ''
        };

        const storiesList = document.getElementById('success-stories-list');
        const storyElement = document.createElement('div');
        storyElement.innerHTML = `
            <h3>${successStory.title}</h3>
            <p>${successStory.story}</p>
            ${successStory.photo ? `<img src="${successStory.photo}" alt="Foto da História" style="width: 100%; height: auto;">` : ''}
            ${successStory.video ? `<video controls style="width: 100%; height: auto;"><source src="${successStory.video}" type="${video.type}"></video>` : ''}
        `;
        storiesList.appendChild(storyElement);
    };
    
    if (photo) {
        reader.readAsDataURL(photo);
    } else {
        reader.onload();
    }
});
