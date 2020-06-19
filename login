using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using WMPLib;
using System.Data.Sql;
using System.Data.SqlClient;
namespace pokemaze
{
    public partial class Loginawal : Form
    {
        public List<string> name = new List<string>();
        public List<string> dif = new List<string>();
        public List<string> diff = new List<string>();
        public List<string> menit = new List<string>();
        public List<string> detik = new List<string>();
        public List<string> lv = new List<string>();
        Image imgbackground = Image.FromFile("background.png");
        string nama = "";
        WindowsMediaPlayer player = new WindowsMediaPlayer();
        SqlConnection sccn = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=" +
             (Application.StartupPath) + "\\main.mdf;Integrated Security=True");
        public Loginawal()
        {
            InitializeComponent();
            player.URL = "awal.mp3";
        }
        void loadlist()
        {
            sccn.Open();
            name .Clear();
            dif .Clear();
            diff.Clear();
            menit.Clear();
            detik.Clear();
            lv.Clear();
            try
            {
                SqlCommand select = new SqlCommand("select * from score order by dif desc,level desc", sccn);
                SqlDataReader readdata = select.ExecuteReader();
                while (readdata.Read())
                {
                    name.Add(readdata.GetString(0)); dif.Add(readdata.GetString(1));
                    diff.Add(readdata.GetString(2)); lv.Add(readdata.GetString(3));
                    menit.Add(readdata.GetString(4));detik.Add(readdata.GetString(5));
                }
                readdata.Close();
            }
            catch (Exception pesan)
            {
                MessageBox.Show(pesan.Message);
            }
            sccn.Close();
        }
        private void Loginawal_Load(object sender, EventArgs e)
        {
            pnlawal.Visible = true;
            pnlhigh.Visible = false;
            player.controls.play();
            string screenWidth = Screen.PrimaryScreen.Bounds.Width.ToString();
            string screenHeight = Screen.PrimaryScreen.Bounds.Height.ToString();
            if (Convert.ToInt32(screenWidth) < 1536 || Convert.ToInt32(screenHeight) < 864)
            {
                MessageBox.Show("Error,Resolusi Terlalu Kecil");
                this.Close();
            }
            panel1.Height = this.Height;
            panel1.Width = this.Width;
        }
        private void btn_new_Click(object sender, EventArgs e)
        {
        
            if (txt_display.Text == "")
            {
                MessageBox.Show("username harus diisi");
            }
            else
            {
                panel1.Visible = false;
                player.controls.stop();
                if (comboBox1.SelectedIndex == 0)
                {
                    Form1 game = new Form1();
                    game.Show();
                    game.MdiParent = this;
                    game.nama = this.txt_display.Text;
                    btn_exit.Visible = false;
                }
                else if(comboBox1.SelectedIndex == 1)
                {
                    Form7 game = new Form7();
                    game.Show();
                    game.MdiParent = this;
                    game.nama = this.txt_display.Text;
                    btn_exit.Visible = false;
                }
                else if (comboBox1.SelectedIndex == 2)
                {
                    Form4 game = new Form4();
                    game.Show();
                    game.MdiParent = this;
                    game.nama = this.txt_display.Text;
                    btn_exit.Visible = false;
                }
            }
        }

        private void btn_highscore_Click(object sender, EventArgs e)
        {
            pnlawal.Visible = false;
            pnlhigh.Visible = true;
            listBox1.Items.Clear();
            loadlist();
            //for (int i = 0; i <name.Count; i++)
            //{
            //    if(i>0)
            //    {
            //        if (int.Parse(dif[i - 1]) < int.Parse(dif[i]))
            //        {
            //            string a = name[i - 1];
            //            string b = dif[i - 1];
            //            string c = diff[i - 1];
            //            string d = lv[i - 1];
            //            string ee = menit[i - 1];
            //            string f = detik[i - 1];
            //            name[i - 1] = name[i];
            //            dif[i - 1] = dif[i];
            //            diff[i - 1] = diff[i];
            //            lv[i - 1] = lv[i];
            //            menit[i - 1] = menit[i];
            //            detik[i - 1] = detik[i];
            //            name[i] = a;
            //            dif[i] = b;
            //            diff[i] = c;
            //            lv[i] = d;
            //            menit[i] = ee;
            //            detik[i] = f;
            //            i = 0;
            //        }
            //        else
            //        {
            //            if (int.Parse(lv[i - 1]) < int.Parse(lv[i]))
            //            {
            //                string a = name[i - 1];
            //                string b = dif[i - 1];
            //                string c = diff[i - 1];
            //                string d = lv[i - 1];
            //                string ee = menit[i - 1];
            //                string f = detik[i - 1];
            //                name[i - 1] = name[i];
            //                dif[i - 1] = dif[i];
            //                diff[i - 1] = diff[i];
            //                lv[i - 1] = lv[i];
            //                menit[i - 1] = menit[i];
            //                detik[i - 1] = detik[i];
            //                name[i] = a;
            //                dif[i] = b;
            //                diff[i] = c;
            //                lv[i] = d;
            //                menit[i] = ee;
            //                detik[i] = f;
            //                i = 0;
            //            }
                        
            //        }
            //    }
                
            //}
            //for (int i = 0; i < name.Count; i++)
            //{
            //    if (i > 0 )
            //    {
            //        if (int.Parse(menit[i - 1]) < int.Parse(menit[i]))
            //        {
            //            string a = name[i - 1];
            //            string b = dif[i - 1];
            //            string c = diff[i - 1];
            //            string d = lv[i - 1];
            //            string ee = menit[i - 1];
            //            string f = detik[i - 1];
            //            name[i - 1] = name[i];
            //            dif[i - 1] = dif[i];
            //            diff[i - 1] = diff[i];
            //            lv[i - 1] = lv[i];
            //            menit[i - 1] = menit[i];
            //            detik[i - 1] = detik[i];
            //            name[i] = a;
            //            dif[i] = b;
            //            diff[i] = c;
            //            lv[i] = d;
            //            menit[i] = ee;
            //            detik[i] = f;
            //            i = 0;
            //        }
            //        else
            //        {
            //            if (int.Parse(detik[i - 1]) < int.Parse(detik[i]))
            //            {
            //                string a = name[i - 1];
            //                string b = dif[i - 1];
            //                string c = diff[i - 1];
            //                string d = lv[i - 1];
            //                string ee = menit[i - 1];
            //                string f = detik[i - 1];
            //                name[i - 1] = name[i];
            //                dif[i - 1] = dif[i];
            //                diff[i - 1] = diff[i];
            //                lv[i - 1] = lv[i];
            //                menit[i - 1] = menit[i];
            //                detik[i - 1] = detik[i];
            //                name[i] = a;
            //                dif[i] = b;
            //                diff[i] = c;
            //                lv[i] = d;
            //                menit[i] = ee;
            //                detik[i] = f;
            //                i = 0;
            //            }
            //        }
            //    }
                
            //}

            for (int i = 0; i < name.Count; i++)
            {
                if (lv[i] == "4")
                {
                    listBox1.Items.Add(name[i] + "-" + diff[i] + " - Level: " + "Finish" + " - Time:" + menit[i] + ":" + detik[i]);
                }
                else
                {
                    listBox1.Items.Add(name[i] + "-" + diff[i] + " - Level: " + lv[i] + " - Time:" + menit[i] + ":" + detik[i]);
                }     
            }
        }

        private void Loginawal_Paint(object sender, PaintEventArgs e)
        {
           
        }

        private void btn_exit_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void btn_back_Click(object sender, EventArgs e)
        {
            pnlawal.Visible = true;
            pnlhigh.Visible = false;
        }

        private void panel1_Paint(object sender, PaintEventArgs e)
        {
            
            e.Graphics.DrawImage(imgbackground, 0, 0, this.Width, this.Height);
        }

        private void button1_Click(object sender, EventArgs e)
        {
            Form10 tutorial = new Form10();
            tutorial.Show();
            tutorial.MdiParent = this;
            btn_exit.Visible = false;
            panel1.Visible = false;
        }
    }
}
