using System;
using UnityEngine;
using UnityEngine.SceneManagement;

// Token: 0x0200001E RID: 30
public class LogoScript : MonoBehaviour
{
	// Token: 0x06000079 RID: 121 RVA: 0x0000377A File Offset: 0x0000197A
	private void Start()
	{
		base.Invoke("BeginGame", 12f);
	}

	// Token: 0x0600007A RID: 122 RVA: 0x000030A8 File Offset: 0x000012A8
	public void BeginGame()
	{
		SceneManager.LoadScene("MainMenu");
	}
}
