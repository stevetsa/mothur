export TERM=linux
echo $TERM
echo `pwd`
export TERM=linux

mothur "#make.contigs(file=all.files, processors=8)"
mothur "#summary.seqs(fasta=all.trim.contigs.fasta)"
mothur "#align.seqs(fasta=all.trim.contigs.fasta, template=silva.bacteria.fasta, processors=8)"
mothur "#summary.seqs(fasta=all.trim.contigs.align)
mothur "#screen.seqs(fasta=all.trim.contigs.fasta, group=all.contigs.groups, maxambig=0, maxhomop=6, optimize=start-end-minlength)"
mothur "#filter.seqs(fasta=all.trim.contigs.good.align, processors=8)"
mothur "#classify.seqs(fasta=all.trim.contigs.good.filter.fasta, name=current, template=silva.bacteria.fasta, taxonomy=silva.bacteria.gg.tax, processor=8)"
mothur "#summary.seqs(fasta=all.trim.contigs.good.fasta)"
echo "done!"
