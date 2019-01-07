class Arp < ActiveRecord::Base
   attr_accessible :search
   validates_presence_of :search


   self.table_name = 'arptableNovo'
   self.primary_key = 'id'

  def self.search(search, search1, search2, search3, search4)

     #find_by_sql("SELECT * FROM arptableNovo WHERE mac_address != 'Incomplete' and ip LIKE '%#{search}%' and vlan LIKE  '%#{search1}%' and  mac_address LIKE  '%#{search2}%' and dt_inicial >= '#{search3} 00:00:00' AND dt_final <= '#{search4} 00:00:00'	limit 5000" )

     sql =  "SELECT * FROM arptableNovo WHERE mac_address != 'Incomplete'"

     if search != ''
       sql +=' and ip LIKE ' + "'%#{search}%'"
     end

     if search1 != ''
      sql +=  'and vlan LIKE ' + "'%#{search1}%'"
     end

     if search2  != ''
       sql +=  'and mac_address LIKE ' + "'%#{search2}%'"
     end

     if search3  != ''
       sql +=  'and dt_inicial >= ' + "'#{search3} 00:00:00'"
     end

     if search4  != ''
       sql +=  'and dt_final <= ' + "'#{search4} 23:59:59'"
     end

     if search == '' and search2 == '' 
      sql += ' order by dt_inicial desc limit 20000 '
     end 

     find_by_sql(sql)

  end

end
