library(reshape2)

grad <- read.csv('data/GRAD_RATE_AND_OUTCOMES_2017.csv', stringsAsFactors = FALSE)

str(grad)

grad$ENROLL_CNT <- as.integer(grad$ENROLL_CNT)
grad$GRAD_CNT <- as.integer(grad$GRAD_CNT)

grad$GradRate <- (grad$GRAD_CNT / grad$ENROLL_CNT) * 100

table(grad$REPORT_SCHOOL_YEAR, useNA='ifany')
table(grad$AGGREGATION_TYPE, useNA='ifany')
table(grad$AGGREGATION_NAME, useNA='ifany')

# School level rows
grad.schools <- grad[grad$AGGREGATION_TYPE == 'School',]
# TODO: Picking just one of the cohorts. Add as an additional UI parameter
grad.schools <- grad.schools[grad.schools$MEMBERSHIP_DESC == '2011 Total Cohort - 6 Year Outcome',]

unique(grad.schools$SUBGROUP_NAME)

school <- grad.schools[grad.schools$AGGREGATION_NAME == 'ALBANY HIGH SCHOOL',]

ggplot(school, aes(x = SUBGROUP_NAME, y = GradRate)) + 
	geom_bar(stat = 'identity') + 
	coord_flip() + ylim(c(0,100)) +
	xlab('') + ylab('Graduation Rate')

school[,c('SUBGROUP_NAME', 'GradRate')]

save(grad, grad.schools, file = 'graduation.rda')
