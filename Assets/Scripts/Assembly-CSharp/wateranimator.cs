using System;
using UnityEngine;

// Token: 0x02000037 RID: 55
public class wateranimator : MonoBehaviour
{
	// Token: 0x060000E7 RID: 231 RVA: 0x00004889 File Offset: 0x00002A89
	private void Start()
	{
		this.curX = base.GetComponent<Renderer>().material.mainTextureOffset.x;
		this.curY = base.GetComponent<Renderer>().material.mainTextureOffset.y;
	}

	// Token: 0x060000E8 RID: 232 RVA: 0x000048C4 File Offset: 0x00002AC4
	private void FixedUpdate()
	{
		this.curX += Time.deltaTime * this.speedX;
		this.curY += Time.deltaTime * this.speedY;
		base.GetComponent<Renderer>().material.SetTextureOffset("_MainTex", new Vector2(this.curX, this.curY));
	}

	// Token: 0x040000BE RID: 190
	public float speedX = 0.1f;

	// Token: 0x040000BF RID: 191
	public float speedY = 0.1f;

	// Token: 0x040000C0 RID: 192
	private float curX;

	// Token: 0x040000C1 RID: 193
	private float curY;
}
