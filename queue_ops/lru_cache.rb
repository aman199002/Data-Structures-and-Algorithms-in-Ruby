@q = []
@h1 = {}

def insert_page(i)
	if @q.size == 3		
		@q.pop
		@q.unshift(i)
	else	
		@q.unshift(i)
	end	
end	

# q = Array.new
insert_page(1)
insert_page(2)
insert_page(3)
insert_page(4)
insert_page(1)
insert_page(2)
print insert_page(5)