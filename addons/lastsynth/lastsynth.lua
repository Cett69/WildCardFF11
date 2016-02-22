packets = require('packets')
windower.register_event('incoming chunk', function(id, data)
    if id == 0x037 then
		--0x30
		local update = packets.parse('incoming', data)
		if update.Status == 0 then
			windower.send_command("wait 3;input /lastsynth")
		end
    end
end)