require 'benchmark'
require 'stringio'

$: << File.dirname(__FILE__) + '/../../lib'

require 'shared-mime-info'

xml_str = <<EOS
<?xml version="1.0" encoding="UTF-8"?>
<D:acl xmlns:D="DAV:">
  <D:ace>
    <D:principal>
      <D:property>
        <D:owner></D:owner>
      </D:property>
    </D:principal>
    <D:grant>
      <D:privilege>
        <D:write></D:write>
      </D:privilege>
      <D:privilege>
        <D:read></D:read>
      </D:privilege>
    </D:grant>
  </D:ace>
</D:acl>
EOS

def profile &block
  require 'rubygems'
  require 'ruby-prof'
  #    RubyProf.measure_mode = RubyProf::CPU_TIME     
  result = RubyProf.profile &block
  graph_printer = RubyProf::GraphHtmlPrinter.new result
  flat_printer = RubyProf::FlatPrinter.new result
  calltree_printer = RubyProf::CallTreePrinter.new result
  File.open('prof_graph.html', 'w') { |f| graph_printer.print f }
  File.open('prof_flat', 'w') { |f| flat_printer.print f }
  File.open('prof_calltree', 'w') { |f| calltree_printer.print f }
end


stream = StringIO.new xml_str

profile do 

  Benchmark.bm(7) do |x|
    x.report("check_magics(xml)") { 100.times { MIME.check_magics stream; stream.rewind } }
  end
end




