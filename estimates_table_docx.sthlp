{smcl}
{* *! version 1.2.9.2 20200616 }{...}
{right:version 1.2.9.2}
{title:Title}
{phang}
{bf:estimates_table_docx} {hline 2} a command giving same functionality as estimates table 
but exports results directly to a Word table

{marker syntax}{...}
{title:Syntax}
{p 8 17 2}
{cmdab:estimates_table_docx}
namelist
[{cmd:,}
{it:options}]

{synoptset 20 tabbed}{...}
{synopthdr}
{synoptline}
{syntab:Main}
{synopt:{opt saving(filename)}}Path/filename of the generated docx file.{p_end}
{synopt:{opt title(string)}}Optional title for table.{p_end}
{synopt:{opt b(%fmt)}}Stata format used for coefficients. Default is %9.2f{p_end}
{synopt:{opt star(numlist)}}Numlist of significance levels. Default is .05 .01 .001. while specifying specify star(none) prints the pvalues{p_end}
{synopt:{opt stats(scalarlist)}}Report scalarlist in table. Allowed is N aic bic {p_end}
{synopt:{opt baselevels}}Include all baselevels.{p_end}
{synopt:{opt keep(coflist)}}List of coefficient to include in table.{p_end}
{synopt:{opt pagesize(psize)}}Set pagesize of Word document.{p_end}
{synopt:{opt landscape}}Use landscape layout for word document.{p_end}
{synopt:{opt eform}}Report parameters as exp(B).{p_end}
{synoptline}
{p2colreset}{...}
{p 4 6 2}

{marker description}{...}
{title:Description}
{pstd}

{pstd}
 {cmd:estimates_table_docx} Takes a namelist of stored estimates and exports this to a publication
 quality table in MS Word. Although it is possible to export estimates to a table 
 using the command putdocx Stata 15 (i.e. putdocx table results = etable) This method causes 
 unwanted formatting issues in the resulting table such as e.g. hidden characters in cells
 making it difficult to choose alignment in the cells and the need to erase these characters.
 estimates_table_docx avoid such issues and allow some additional benefits by providing 
 options for the formating of the resulting table and inclusion of legend etc.

{marker options}{...}
{title:Options}
{dlgtab:Main}

{phang}
{opt saving(string)}Path/filename of the generated docx file.

{phang}
{opt title(string)} Optional title for table.

{phang}
{opt b(%fmt)} Specifies how the coefficients are to be displayed. Default is %9.2f

{phang}
{opt star(numlist .05 .01 .001)} significanse levels. If stats(none) is passed pvalues are printed within parentheses with three decimal places.

{phang}
{opt stats(scalarlist)} List of statistics from e() to be displayed at bottom of table. Currently aic, bic and N can be specified.
Default behavior is to display N. If you do not want anything to be displayed at bottom of table specify stats(none).

{phang}
{opt baselevels} Include all baselevels in the resulting table.

{phang}
{opt keep(coflist)} List of coefficient to include in table. Will present parameters in the specified order.
Specify the the variables to be included as in estimation command but exclude level indicators.
For Model 3 in examples you would specify age race collgrad wage grade tenure collgrad#race collgrad#tenure _cons

{phang}
{opt pagesize(psize)} Set pagesize of Word document. psize may be letter, legal, A3, A4, or B4JIS. Default is pagesize(A4)

{phang}
{opt landscape} Use landscape layout for Word document.

{phang}
{opt eform} Report parameters as exp(B).

{marker examples}{...}
{title:Examples}

    {hline}
    Setup
{phang2}{cmd:. sysuse nlsw88, clear}{p_end}

{pstd}Run estimation command{p_end}
{phang2}{cmd:. logistic never_married c.age i.race i.collgrad c.wage}

{pstd}Store model using estimates{p_end}
{phang2}{cmd:. estimates store _1_}

{pstd}Run second model{p_end}
{phang2}{cmd:. logistic never_married c.age i.race i.collgrad c.wage c.grade}

{pstd}Store second model using estimates{p_end}
{phang2}{cmd:. estimates store _2_}

{pstd}Run third model{p_end}
{phang2}{cmd:. logistic never_married c.age i.race b1.collgrad c.wage c.grade c.tenure collgrad#race b1.collgrad#c.tenure}

{pstd}Store third model using estimates{p_end}
{phang2}{cmd:. estimates store _3_}

{pstd}Run command to produce table in Word document estimates_table.docx{p_end}
{phang2}{cmd:. estimates_table_docx base grade tenure, star(.05 .01 .001) b(.001) title("Table 1: Test title") baselevels}
    {hline}


{title:Author}
{p}

Dr Glenn Sandström, Umeå Univerity, Sweden.
Email: {browse "mailto:glenn.sandstrom@umu.se":glenn.sandstrom@umu.se}
Web:{browse "http://www.idesam.umu.se/english/about/staff/?uid=glsa0001"}


{title:See Also}
Related commands:


