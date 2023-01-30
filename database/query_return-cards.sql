SELECT cards.id as card_id, cards.card_title, cards.card_content, GROUP_CONCAT(tags.tag_name) as tags
FROM cards
LEFT JOIN card_tags ON cards.id = card_tags.card_id
LEFT JOIN tags ON card_tags.tag_id = tags.id
GROUP BY cards.id;