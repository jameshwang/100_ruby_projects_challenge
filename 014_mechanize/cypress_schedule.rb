TERM=201320&TERM_DESC=Spring+2014&sel_subj=dummy&sel_day=dummy&sel_schd=dummy&sel_camp=dummy&sel_sess=dummy&sel_instr=dummy&sel_instr=%25&sel_ptrm=dummy&sel_ptrm=%25&begin_hh=5&begin_mi=0&begin_ap=a&end_hh=11&end_mi=0&end_ap=p&sel_subj=ACCT&sel_camp=1&aa=N

https://www.webstar.nocccd.edu/prod/pw_pub_sched.p_listthislist


require 'rubygems'
require 'mechanize'

page = Mechanize.new{|a| a.ssl_version, a.verify_mode, a.user_agent_alias = 'SSLv3', OpenSSL::SSL::VERIFY_NONE, 'Mac Safari'}

query = {:TERM => '201320',
:TERM_DESC => 'Spring 2014',
:sel_subj => 'dummy',
:sel_day => 'dummy',
:sel_schd => 'dummy',
:sel_camp => 'dummy',
:sel_sess => 'dummy',
:sel_instr => 'dummy',
:sel_instr => '%',
:sel_ptrm => 'dummy',
:sel_ptrm => '%',
:begin_hh => '5',
:begin_mi => '0',
:begin_ap => 'a',
:end_hh => '11',
:end_mi => '0',
:end_ap => 'p',
:sel_subj => 'ACCT',
:sel_camp => '1',
:aa => 'N'}

html = page.post('https://www.webstar.nocccd.edu/prod/pw_pub_sched.p_listthislist', "TERM=201320&TERM_DESC=Spring+2014&sel_subj=dummy&sel_day=dummy&sel_schd=dummy&sel_camp=dummy&sel_sess=dummy&sel_instr=dummy&sel_instr=%25&sel_ptrm=dummy&sel_ptrm=%25&begin_hh=5&begin_mi=0&begin_ap=a&end_hh=11&end_mi=0&end_ap=p&sel_subj=ACCT&sel_camp=1&aa=N")

class_urls = []


html.search('table tr').each do |row|
  if row.search('td')[1] && row.search('td')[1].text.to_i > 0
    class_urls << row.search('td a')[1].attr('href').match(/JavaScript:winOpen\('(.*)'\)/)[1]
  end
end


