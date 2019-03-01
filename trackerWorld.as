package 
{
	import net.flashpunk.FP;
	import net.flashpunk.World;
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Image;
	public class trackerWorld extends World
	{
		protected var bombs:progressive;
		protected var bombbag:progressive;
		protected var bow:progressive;
		protected var quiver:progressive;
		public function trackerWorld() 
		{
			addGraphic(new Image(A.bg));
			//item screen
			//row 1
			add(new item(7, 12, A.ocarina, true));
			add(bow = new progressive(49, 12, [A.bow, A.bow40, A.bow50]));
			add(new item(91, 12, A.fire));
			add(new item(133, 12, A.ice));
			add(new item(175, 12, A.light));
			add(new item(217, 12, A.roomkey));
			//row 2
			add(bombs = new progressive(7, 60, [A.bomb, A.bomb30, A.bomb40]));
			add(new item(49, 60, A.bombchu));
			add(new item(91, 60, A.stick));
			add(new item(133, 60, A.nut));
			add(new item(175, 60, A.beans));
			add(new progressive(217, 60, [A.moonstear, A.land, A.swamp, A.mountain, A.ocean]));
			//row 3
			add(new item(7, 108, A.keg));
			add(new item(49, 108, A.picto));
			add(new item(91, 108, A.lens));
			add(new item(133, 108, A.hookshot));
			add(new item(175, 108, A.gfs));
			add(new progressive(217, 108, [A.letter, A.pendant, A.express]));
			//row 4
			add(new item(7, 156, A.redpotion));
			add(new item(49, 156, A.golddust));
			add(new item(91, 156, A.milk));
			add(new item(133, 156, A.chataeu));
			add(new item(175, 156, A.bottle));
			add(new item(217, 156, A.bigpoe));
			
			//mask screen
			//row 1
			add(new item(7, 211, A.postman));
			add(new item(49, 211, A.allnight));
			add(new item(91, 211, A.blast));
			add(new item(133, 211, A.stone));
			add(new item(175, 211, A.greatfairy));
			add(new item(217, 211, A.deku));
			//row 2
			add(new item(7, 259, A.keaton));
			add(new item(49, 259, A.bremen));
			add(new item(91, 259, A.bunny));
			add(new item(133, 259, A.dongero));
			add(new item(175, 259, A.scents));
			add(new item(217, 259, A.goron));
			//row 3
			add(new item(7, 307, A.romani));
			add(new item(49, 307, A.circus));
			add(new item(91, 307, A.kafei));
			add(new item(133, 307, A.couples));
			add(new item(175, 307, A.truth));
			add(new item(217, 307, A.zora));
			//row 4
			add(new item(5, 355, A.kamaro));
			add(new item(49, 355, A.gibdo));
			add(new item(91, 355, A.garo));
			add(new item(133, 355, A.captain));
			add(new item(175, 355, A.giant));
			add(new item(217, 355, A.fd));
			
			//quest status screen
			//remains
			add(new item(51, 466, A.odolwa));
			add(new item(49, 407, A.goht));
			add(new item(8, 436, A.gyorg));
			add(new item(91, 437, A.twinmold));
			 
			//upgrades
			//row 1
			add(new progressive(132, 413, [A.sword, A.razor, A.guilded], true));
			add(new progressive(174, 413, [A.shield, A.mirror], true));
			add(new item(216, 413, A.notebook));
			//row 2
			add(quiver = new progressive(132, 461, [A.quiver, A.quiver40, A.quiver50]));
			add(bombbag = new progressive(174, 461, [A.bombbag, A.bombbag30, A.bombbag40]));
			add(new progressive(216, 461, [A.wallet200, A.wallet500]));
			
			//songs
			add(new song(256, 11, A.time, true));
			add(new song(256, 61, A.healing, true));
			add(new song(256, 111, A.epona));
			add(new song(256, 161, A.soaring));
			add(new song(256, 211, A.storms));
			add(new song(256, 261, A.sonata));
			add(new song(256, 311, A.lullaby));
			add(new song(256, 361, A.bossanova));
			add(new song(256, 411, A.elegy));
			add(new song(256, 461, A.oath));
			
			//define paired items
			bombs.setTwin(bombbag);
			bombbag.setTwin(bombs);
			bow.setTwin(quiver);
			quiver.setTwin(bow);
		}
	}
}