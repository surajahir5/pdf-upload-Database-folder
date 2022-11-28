# pdf-upload-Database-folder
pdf upload in database and folder and download file from database &amp; folder 
 // ---------------------------------------Download file from folder --------------------------------------------------------

            GridViewRow gr = GridView1.SelectedRow;
            string filepath1 =  gr.Cells[2].Text;
            string path1 = "E:/suraj/PDFUPLOADED/PDFUPLOADED/file/" + filepath1;
            WebClient req = new WebClient();
            HttpResponse response = HttpContext.Current.Response;
            HttpContext.Current.Response.ContentType = "doc/pdf";
            response.Clear();
            response.ClearContent();
            response.ClearHeaders();
            response.Buffer = true;
            response.AddHeader("Content-Disposition", "attachment;filename=" + path1);
            byte[] data = req.DownloadData(path1);
            response.BinaryWrite(data);
            response.End();
