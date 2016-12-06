<table class="table table-striped table-bordered">
    <thead>
    <tr>
        <th class="sort-asc id-title">No.</th>
        <th class="sort-asc">Name</th>
        <th class="sort-asc">Client</th>
        <th class="sort-asc">Planning year</th>
        <th class="sort-asc">From year</th>
        <th class="sort-asc">To year</th>
        <th class="sort-asc">Status</th>
        <th class="tool-title-3">Control</th>
    </tr>
    </thead>
    <tbody>
    <?php foreach($portfolios as $key => $item){ ?>
    <tr>
        <td class="text-center"><?php echo $key + 1 ?></td>
        <td><?php echo $item['portfolioname']?></td>
        <td><?php echo $item['clientname']?></td>
        <td><?php echo $item['planningyear']?></td>
        <td><?php echo $item['fromyear']?></td>
        <td><?php echo $item['toyear']?></td>
        <td>

            <span class="label <?php echo ($item['status'] == 'active')? 'label-success':'label-primary';?> label-bordered"><?php echo $this->document->status[$item['status']]?></span>
        </td>
        <td class="text-center">
            <button onclick="window.location.href='?route=fmra/portfolio/update&id=<?php echo $item['id']?>'" type="button" class="btn btn-sm btn-default btn-icon btn-info margin-0 margin-right-5"><span class="fa fa-edit"></span></button>
            <button type="button" class="btn btn-sm btn-default btn-icon btn-danger margin-0 margin-right-5" onclick="portfolio.showDeleteDialog(<?php echo $item['id']?>)"><span class="fa fa-trash"></span></button>
            
        </td>
    </tr>
    <?php } ?>
    </tbody>
</table>
<?php echo $pagination?>