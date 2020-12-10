jolt_steps = DATA.read.split("\n").map(&:to_i).sort
jolt_steps << max_jolts = jolt_steps.last + 3 # max jolts is always +3 to latest adapter

# part 1
one_jolt_steps = 0
three_jolt_steps = 0
current_jolts = 0
potential_varieties = 1

jolt_steps.each.with_index do |jolt_step, index|
  jolt_diff_to_next_adapter = jolt_step - current_jolts

  break if jolt_diff_to_next_adapter > 3 # no further feasibile jolt_steps

  one_jolt_steps += 1 if jolt_diff_to_next_adapter == 1
  three_jolt_steps += 1 if jolt_diff_to_next_adapter == 3

  current_jolts = jolt_step
end
p "product of single and three-jolt steps: #{one_jolt_steps * three_jolt_steps}"

# part 2
varieties = { 0 => 1 } # zero jolts has 1 potential combination, this get's us started

jolt_steps.each do |jolts|
  varieties[jolts] = varieties.sum { |variety_jolts, variety_count| jolts - variety_jolts <= 3 ? variety_count : 0 }
end

p "potential varieties: #{varieties.values.last}"

__END__
95
43
114
118
2
124
120
127
140
21
66
103
102
132
136
93
59
131
32
9
20
141
94
109
143
142
65
73
27
83
133
104
60
110
89
29
78
49
76
16
34
17
105
98
15
106
4
57
1
67
71
14
92
39
68
125
113
115
26
33
61
45
46
11
99
7
25
130
42
3
10
54
44
139
50
8
58
86
64
77
35
79
72
36
80
126
28
123
119
51
22
