function [X, unique_cards] = prepare_data(data)
%PREPARE_DATA Convert the list of cards and deck to a matrix representation
%             where each row is a unique card and each column a deck. The
%             value in each cell is the number of time the card appears in
%             the deck
%
%   input -----------------------------------------------------------------
%
%       o data   : (60, M) a dataset of M decks. A deck contains 60 non
%       necesserally unique cards
%
%   output ----------------------------------------------------------------
%
%       o X  : (N x M) matrix representation of the frequency of appearance
%       of unique cards in the decks whit N the number of unique cards in
%       the dataset and M the number of decks
%       o unique_cards : {N x 1} the set of unique card names as a cell
%       array
%
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% This function will compare two strings to create X 
% one string will be the unique card
% the other one will be a string with all the card of the deck with this
% form: 'next card_1 next card_2 next ... card_N next'

unique_cards=unique(data);
U=string(unique_cards);
data=string(data);
[N M]=size(data);

%create a string with all the card of the deck. The string will have the
%form 'next card_1 next card_2 next card_3 .. card_N next'. 

% the 'next' between each card is use so that when we use the function
% strcat we don't confuse two cards with similar name'
for k=1:M
    deck(k)=data(1,k);
    for v=1:59
        deck(k)=strcat(deck(k),'n',data(v+1,k));
    end
    deck(k)=strcat('n',deck(k),'n');
end
for i=1:length(U)
    for j=1:M
        
        compare=strcat('n',U(i),'n');
        % use strfind to extract the index of each occurence of the patern
        % compare 
        index= strfind(deck(j),compare);
        X(i,j) = length(index);
        

    end
end

% this method works but it has a big computational cost 
% there are other solutions 


end

