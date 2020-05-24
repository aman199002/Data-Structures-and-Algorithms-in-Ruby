# Validate IP Address
# Validate an IP address (IPv4). An address is valid if and only if it is in the form "X.X.X.X", where each X is a number from 0 to 255.
# For example, "12.34.5.6", "0.23.25.0", and "255.255.255.255" are valid IP addresses, while "12.34.56.oops", "1.2.3.4.5", and "123.235.153.425" are invalid IP addresses.

# Examples:

# ip = '192.168.0.1'
# output: true

# ip = '0.0.0.0'
# output: true

# ip = '123.24.59.99'
# output: true

# ip = '192.168.123.456'
# output: false

def validate_ip(s)
  return false if s == nil || s.size == 0
  sub = ''  # Initialize substring to store each segment.
  count = 0  # Initialize count to store number of segments.
  for i in 0..s.size-1 do
    # Increment count if char equals '.'
    # If count equals 4 i.e string has 4 dots, return false.
    # Or if segment if not valid, return false.
    if s[i] == '.'
      count = count + 1
      return false if count == 4 || !is_valid(sub)
      sub = ''
    else
      # Return false if segment has more than 3 chars, else append.
      return false if sub.size > 3
      sub = sub + s[i]
    end
  end
  # If last segment is empty or not valid, return false
  return false if sub == '' || !is_valid(sub)
  # Increment count for last segment
  count = count + 1
  # If count equals 4 return true, else false.
  return(count == 4 ? true : false)
end

private

def is_valid(sub)
  # If any char is not a number, return false.
  for i in 0..sub.size-1 do
    if !(sub[i] >= '0' && sub[i] <= '9')
      return false
    end
  end
  i = sub.to_i  # Convert segment to integer.
  # If range is valid, return true else false.  
  if i >= 0 && i <= 255
    return true
  end
  return false
end

puts validate_ip('192.168.0.1')
puts validate_ip('0.0.0.0')
puts validate_ip('0')
puts validate_ip('0.0.0...')
puts validate_ip('0.010374970.0')
puts validate_ip('0.0.3e.a')
puts validate_ip('')
