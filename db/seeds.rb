# frozen_string_literal: true

Category.create([{ name: 'Snacks' }, { name: 'Kaltgetränke' }, { name: 'Heißgetränke' }])
Article.create([{ name: 'Brezel', category_id: 1, price: 100 },
                { name: 'Fanta', category_id: 2, price: 150 }])
